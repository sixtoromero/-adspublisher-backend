using AdsPublisher.Domain.Entity;
using AdsPublisher.Domain.Interface;
using AdsPublisher.InfraStructure.Interface;
using AdsPublisher.Transversal.Utils;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AdsPublisher.Domain.Core
{
    public class PQRSDomain : IPQRSDomain
    {
        private readonly IPQRSRepository _Repository;
        public IConfiguration Configuration { get; }

        public PQRSDomain(IPQRSRepository Repository, IConfiguration _configuration)
        {
           _Repository = Repository;
            Configuration = _configuration;
        }

        public async Task<bool> InsertAsync(PQRS model)
        {
            return await _Repository.InsertAsync(model);
        }

        public async Task<bool> UpdateAsync(PQRS model)
        {
            return await _Repository.UpdateAsync(model);
        }

        public async Task<bool> DeleteAsync(int IDPQRS)
        {
            return await _Repository.DeleteAsync(IDPQRS);
        }

        public async Task<PQRS> GetAsync(int IDPQRS)
        {
            return await _Repository.GetAsync(IDPQRS);
        }

        public async Task<IEnumerable<PQRS>> GetAllAsync(int IDCliente)
        {
            return await _Repository.GetAllAsync(IDCliente);
        }

    }
}
