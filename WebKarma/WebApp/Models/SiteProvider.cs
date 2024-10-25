namespace WebApp.Models;

public class SiteProvider : BaseProvider
{
    public SiteProvider(IConfiguration configuration) : base(configuration)
    {
    }

    ProductRepository? product;
    public ProductRepository Product => product ??= new ProductRepository(Connection);

    CategoryRepository? category;
    public CategoryRepository Category => category ??= new CategoryRepository(Connection);

    BrandRepository? brand;
    public BrandRepository Brand => brand ??= new BrandRepository(Connection);

    BannerRepository? banner;
    public BannerRepository Banner => banner ??= new BannerRepository(Connection);
    BlogRepository? blog;
    public BlogRepository Blog => blog ??= new BlogRepository(Connection);
}