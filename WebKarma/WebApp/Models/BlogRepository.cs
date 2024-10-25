using Dapper;
using System.Data;

namespace WebApp.Models;

public class BlogRepository : BaseRepository
{
    public BlogRepository(IDbConnection connection) : base(connection)
    {
    }

    public Blog? GetBlog(int id)
    {
        string sql = "SELECT * FROM Blog WHERE BlogId = @Id";
        return connection.QuerySingleOrDefault<Blog>(sql, new { id });
    }

    public IEnumerable<Blog> GetBlogs()
    {
        return connection.Query<Blog>("SELECT * FROM Blog");
    }
}

