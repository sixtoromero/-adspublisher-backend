﻿using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AdsPublisher.Application.DTO;
using AdsPublisher.Application.Interface;
using AdsPublisher.Services.WebAPIRest.Helpers;
using AdsPublisher.Transversal.Common;
using AdsPublisher.Transversal.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace AdsPublisher.Services.WebAPIRest.Controllers.API
{
    [Authorize]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PlanesController : Controller
    {
        private readonly IPlanesApplication _Application;
        private readonly AppSettings _appSettings;

        public PlanesController(IPlanesApplication _Application,
                                  IOptions<AppSettings> appSettings)
        {
            this._Application = _Application;
            _appSettings = appSettings.Value;
        }

        [HttpGet]
        public async Task<IActionResult> GetAsync(int ID)
        {
            Response<PlanesDTO> response = new Response<PlanesDTO>();

            try
            {
                response = await _Application.GetAsync(ID);
                if (response.IsSuccess)
                {
                    return Ok(response);
                }
                else
                {
                    return BadRequest(response);
                }
            }
            catch (Exception ex)
            {
                response.Data = null;
                response.IsSuccess = false;
                response.Message = ex.Message;

                return BadRequest(response);
            }
        }

        [HttpGet]
        public async Task<IActionResult> GetAllAsync()
        {
            Response<IEnumerable<PlanesDTO>> response = new Response<IEnumerable<PlanesDTO>>();

            try
            {
                response = await _Application.GetAllAsync();
                if (response.IsSuccess)
                {
                    return Ok(response);
                }
                else
                {
                    return BadRequest(response);
                }
            }
            catch (Exception ex)
            {
                response.Data = null;
                response.IsSuccess = false;
                response.Message = ex.Message;

                return BadRequest(response);
            }
        }
    }
}