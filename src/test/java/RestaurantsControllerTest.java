import static org.hamcrest.core.IsCollectionContaining.hasItems;
import static org.mockito.Mockito.*;
import static
        org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static
        org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static
        org.springframework.test.web.servlet.setup.MockMvcBuilders.*;

import com.stanislav.business.repository.RestaurantRepository;
import com.stanislav.business.service.RestaurantService;
import com.stanislav.business.service.RestaurantServiceImpl;
import com.stanislav.business.web.RestaurantsController;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/appconfig-root.xml")
public class RestaurantsControllerTest {

    @Autowired
    private RestaurantService restaurantService;

    MockMvc mockMvc;

    @Before
    public void setup() {

        RestaurantsController controller = new RestaurantsController(restaurantService);

        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/jsp/view/");
        viewResolver.setSuffix(".jsp");

         mockMvc = MockMvcBuilders.standaloneSetup(controller)
                .setViewResolvers(viewResolver)
                .build();
    }

    @Test
    public void testRestaurantsPage() throws Exception {

        mockMvc.perform(get("/restaurants"))
                .andExpect(view().name("restaurants"))
                .andExpect(model().attributeExists("count", "pageNumber", "allPages", "restaurantList"));

    }


    @Test
    public void testRestaurantsPageWithRestaurantsOnPageParameter() throws Exception {

        mockMvc.perform(get("/restaurants?restaurantsOnPage=5"))
                .andExpect(view().name("restaurants"))
                .andExpect(model().attributeExists("count", "pageNumber"))
                .andExpect(model().attribute("count", "5"))
                .andExpect(model().attribute("pageNumber", "1"));

    }

    @Test
    public void testRestaurantsPageWithPageNumberParameter() throws Exception {

        mockMvc.perform(get("/restaurants?pageNumber=2"))
                .andExpect(view().name("restaurants"))
                .andExpect(model().attributeExists("count", "pageNumber"))
                .andExpect(model().attribute("count", "5"))
                .andExpect(model().attribute("pageNumber", "2"));

    }

    @Test
    public void testRestaurantsPageWithParameters() throws Exception {

        mockMvc.perform(get("/restaurants?restaurantsOnPage=10&pageNumber=2"))
                .andExpect(view().name("restaurants"))
                .andExpect(model().attributeExists("count", "pageNumber"))
                .andExpect(model().attribute("count", "10"))
                .andExpect(model().attribute("pageNumber", "2"));

    }

    @Test
    public void testNumberOfPages() throws Exception {

        mockMvc.perform(get("/restaurants?restaurantsOnPage=5"))
                .andExpect(view().name("restaurants"))
                .andExpect(model().attribute("allPages",
                        restaurantService.getNumberOfAllPages(5).toString()));

    }

}
