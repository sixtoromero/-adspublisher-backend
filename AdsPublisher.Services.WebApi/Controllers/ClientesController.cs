using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AdsPublisher.Application.DTO;
using AdsPublisher.Application.Interface;
using AdsPublisher.Services.WebApi.Helpers;
using AdsPublisher.Transversal.Common;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace AdsPublisher.Services.WebApi.Controllers
{
    [Authorize]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ClientesController : Controller
    {
        private readonly IClientesApplication _clienteApplication;
        private readonly AppSettings _appSettings;

        public ClientesController(IClientesApplication clienteApplication, IOptions<AppSettings> appSettings)
        {
            _clienteApplication = clienteApplication;
            _appSettings = appSettings.Value;
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> GetLoginAsync([FromBody]ClientesDTO clienteDto)
        {
            var response = await _clienteApplication.GetLoginAsync(clienteDto.Correo, clienteDto.Password);

            if (response.IsSuccess)
            {
                response.Data.Token = BuildToken(response);
                return Ok(response);
            }

            return BadRequest(response.Message);
        }

        [HttpPost]
        public async Task<IActionResult> InsertAsync([FromBody]ClientesDTO clienteDto)
        {
            if (clienteDto == null)
                return BadRequest();

            var response = await _clienteApplication.InsertAsync(clienteDto);
            if (response.IsSuccess)
            {
                return Ok(response);
            }
            else
            {
                return BadRequest(response.Message);
            }
        }

        [HttpPost]
        public async Task<IActionResult> UpdateAsync([FromBody]ClientesDTO clienteDto)
        {
            if (clienteDto == null)
                return BadRequest();

            var response = await _clienteApplication.UpdateAsync(clienteDto);
            if (response.IsSuccess)
            {
                return Ok(response);
            }
            else
            {
                return BadRequest(response.Message);
            }
        }

        [HttpGet]
        public async Task<IActionResult> GetAllAsync()
        {
            var response = await _clienteApplication.GetAllAsync();
            if (response.IsSuccess)
                return Ok(response);

            return BadRequest(response.Message);
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var response = await _clienteApplication.GetAllAsync();
            if (response.IsSuccess)
                return Ok(response);

            return BadRequest(response.Message);
        }

        [HttpGet]
        public IActionResult GetConsulta()
        {            
            return Ok("OK");
        }

        [HttpGet]
        public async Task<IActionResult> GetActivation(string email)
        {
            var response = await _clienteApplication.SetActivation(email);
            if (response.IsSuccess)
                return Ok(response);

            return BadRequest(response.Message);
        }

        private string BuildToken(Response<ClientesDTO> usersDto)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, usersDto.Data.IDCliente.ToString())
                }),

                //Expires = DateTime.UtcNow.AddMinutes(1),
                Expires = DateTime.UtcNow.AddHours(24),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature),
                Issuer = _appSettings.IsSuer,
                Audience = _appSettings.Audience

            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            var tokenString = tokenHandler.WriteToken(token);
            return tokenString;
        }
    }
}