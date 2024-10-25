using System.Data;
using Dapper;

namespace WebApp.Models;

public class InvoiceRepository : BaseRepository
{
    public InvoiceRepository(IDbConnection connection) : base(connection)
    {
    }

    public int Add(Invoice obj){
        obj.InvoiceDate = DateTime.Now;
        obj.InvoiceId = Guid.NewGuid().ToString().Replace("-", "");
        return connection.Execute("AddInvoice", new {
            obj.Address,
            obj.CartCode,
            obj.City,
            obj.Country,
            obj.Email,
            obj.FirstName,
            obj.InvoiceDate,
            obj.InvoiceId,
            obj.State,
            obj.PostCode,
            obj.Phone,
            obj.Note,
            obj.LastName
        }, commandType: CommandType.StoredProcedure);
    }

    public decimal GetAmount(string id){
        return connection.ExecuteScalar<decimal>("GetInvoiceAmount", new {Id = id}, commandType: CommandType.StoredProcedure);
    }
}