package sit.int202.classicmodels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Office;
import sit.int202.classicmodels.repositories.OfficeRepository;

import java.io.*;
import java.util.List;

@WebServlet(name = "OfficeSearchServlet", value = "/office-search")
public class OfficeSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchCityCountry = request.getParameter("searchByCityOrCountry");
        if(searchCityCountry != null){
            OfficeRepository repository = new OfficeRepository();
            List<Office> offices = repository.findByCityOrCountry(searchCityCountry);
            request.setAttribute("offices", offices);
        }
        request.getServletContext().getRequestDispatcher("/office_list.jsp").forward(request,response);
    }
}
 