using Dapper;
using System.Data;

namespace WebApp.Models;

public class BannerRepository : BaseRepository
{
    public BannerRepository(IDbConnection connection) : base(connection)
    {
    }

    public IEnumerable<Banner> GetBanners()
    {
        return connection.Query<Banner>("SELECT TOP 2 * FROM Banner ORDER BY NEWID()");
    }
}

