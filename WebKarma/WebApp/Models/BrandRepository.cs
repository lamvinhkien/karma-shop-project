using Dapper;
using System.Data;

namespace WebApp.Models;

public class BrandRepository : BaseRepository
{
    public BrandRepository(IDbConnection connection) : base(connection)
    {
    }

    public IEnumerable<Brand> GetBrands()
    {
        return connection.Query<Brand>("SELECT TOP 5 * FROM Brand ORDER BY NEWID()");
    }
}

