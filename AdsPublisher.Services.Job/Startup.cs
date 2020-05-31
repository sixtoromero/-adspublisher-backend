using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using Hangfire;
using Hangfire.MemoryStorage;

namespace AdsPublisher.Services.Job
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddHangfire(Configure =>
                Configure.SetDataCompatibilityLevel(CompatibilityLevel.Version_170)
                .UseSimpleAssemblyNameTypeSerializer()
                .UseDefaultTypeSerializer()
                .UseMemoryStorage());

            services.AddHangfireServer();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env,
            IBackgroundJobClient backgroundJobClient,
            IRecurringJobManager recurringJobManager)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGet("/", async context =>
                {
                    await context.Response.WriteAsync("Tarea programada!");
                });
            });

            app.UseHangfireDashboard();
            backgroundJobClient.Enqueue(() => Console.WriteLine("Servicio iniciado!"));
            recurringJobManager.AddOrUpdate(
                "Ejecuta 1 vez al día",
                () =>
                    SetPagosCulminados(),
                    //Console.WriteLine("Ejecutando tareas"),
                "* * * * *" //Corre una vez al día
            );  ;
            //"0 0 * * *" //Corre una vez al día
        }

        public bool SetPagosCulminados()
        {
            var url = $"http://adspublisher.io.ngrok.io/api/MicroEmpresas/GetPagosCulminados";
            var request = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "application/json";
            request.Accept = "application/json";

            try
            {
                using (System.Net.WebResponse response = request.GetResponse())
                {
                    using (System.IO.Stream strReader = response.GetResponseStream())
                    {
                        if (strReader == null) return false;
                        using (System.IO.StreamReader objReader = new System.IO.StreamReader(strReader))
                        {
                            string responseBody = objReader.ReadToEnd();
                            // Do something with responseBody
                            //Console.WriteLine(responseBody);
                            return true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }
    }
}
