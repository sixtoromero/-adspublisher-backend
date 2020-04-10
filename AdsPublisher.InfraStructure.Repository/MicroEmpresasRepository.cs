using AdsPublisher.Domain.Entity;
using AdsPublisher.InfraStructure.Interface;
using AdsPublisher.Transversal.Common;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace AdsPublisher.InfraStructure.Repository
{
    public class MicroEmpresasRepository : IMicroEmpresasRepository
    {
        private readonly IConnectionFactory _connectionFactory;
        public MicroEmpresasRepository(IConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<bool> InsertAsync(MicroEmpresas model)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "uspMicroEmpresaInsert";
                var parameters = new DynamicParameters();
                parameters.Add("IDCliente", model.IDCliente);
                parameters.Add("Nombre", model.Nombre);
                parameters.Add("Descripcion", model.Descripcion);
                parameters.Add("Fax", model.Fax);
                parameters.Add("Telefono", model.Telefono);
                parameters.Add("Celular", model.Celular);
                parameters.Add("Direccion", model.Direccion);
                parameters.Add("Longitud", model.Longitud);
                parameters.Add("Latitud", model.Latitud);

                //Persistir la info en la bd
                var result = connection.QuerySingle<string>(query, param: parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result == "success" ? true : false;
            }
        }

        public async Task<bool> UpdateAsync(MicroEmpresas model)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "uspMicroEmpresaUpdate";
                var parameters = new DynamicParameters();

                parameters.Add("IDMicroEmpresa", model.IDMicroEmpresa);
                parameters.Add("IDCliente", model.IDCliente);
                parameters.Add("Nombre", model.Nombre);
                parameters.Add("Descripcion", model.Descripcion);
                parameters.Add("Fax", model.Fax);
                parameters.Add("Telefono", model.Telefono);
                parameters.Add("Celular", model.Celular);
                parameters.Add("Direccion", model.Direccion);
                parameters.Add("Longitud", model.Longitud);
                parameters.Add("Latitud", model.Latitud);

                //Persistir la info en la bd
                var result = connection.QuerySingle<string>(query, param: parameters, commandType: System.Data.CommandType.StoredProcedure);
                return result == "success" ? true : false;
            }
        }

        public async Task<bool> DeleteAsync(int IDMicroEmpresa)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "uspDelMicroEmpresa";
                var parameters = new DynamicParameters();

                parameters.Add("IDMicroEmpresa", IDMicroEmpresa);

                var result = await connection.ExecuteAsync(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result > 0;

            }
        }

        public async Task<MicroEmpresas> GetAsync(int IDMicroEmpresa)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspgetMicroEmpresaByID";
                var parameters = new DynamicParameters();

                parameters.Add("IDMicroEmpresa", IDMicroEmpresa);

                var result = await connection.QuerySingleAsync<MicroEmpresas>(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result;
            }
        }

        public async Task<IEnumerable<MicroEmpresas>> GetAllAsync(int IDCliente)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspGetMicroEmpresas";                
                var parameters = new DynamicParameters();

                parameters.Add("IDCliente", IDCliente);

                var result = await connection.QueryAsync<MicroEmpresas>(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result;
            }
        }

    }
}
