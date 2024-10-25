using Dapper;
using System.Data;

namespace WebApp.Models;

public class ProductRepository : BaseRepository
{
    public ProductRepository(IDbConnection connection) : base(connection)
    {
    }

    public Product? GetProduct(int id)
    {
        string sql = "SELECT * FROM Product WHERE ProductId = @Id";
        return connection.QuerySingleOrDefault<Product>(sql, new { id });
    }

    public IEnumerable<Product> GetProducts()
    {
        return connection.Query<Product>("SELECT * FROM Product");
    }

    public IEnumerable<Product> GetLastestProducts()
    {
        return connection.Query<Product>("SELECT TOP 8 * FROM Product ORDER BY NEWID()");
    }

    public IEnumerable<Product> GetDealOfWeek()
    {
        return connection.Query<Product>("SELECT TOP 6 * FROM Product ORDER BY NEWID()");
    }

    public IEnumerable<Product> GetExclusiveDeal()
    {
        return connection.Query<Product>("SELECT TOP 2 * FROM Product ORDER BY NEWID()");
    }
}

