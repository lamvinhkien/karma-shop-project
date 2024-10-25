using Dapper;
using System.Data;

namespace WebApp.Models;

public class CategoryRepository : BaseRepository
{
    public CategoryRepository(IDbConnection connection) : base(connection)
    {
    }

    public IEnumerable<Category> GetCategorys()
    {
        return connection.Query<Category>("SELECT * FROM Category");
    }
}

