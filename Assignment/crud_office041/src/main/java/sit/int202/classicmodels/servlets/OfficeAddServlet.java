package sit.int202.classicmodels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Office;
import sit.int202.classicmodels.repositories.OfficeRepository;

import java.io.*;

@WebServlet(name = "OfficeAddServlet", value = "/office-add")
public class OfficeAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getServletContext().getRequestDispatcher("/office_add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeRepository repository = new OfficeRepository();
        String officeCode = request.getParameter("officeCode");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("addressLine1");
        String country = request.getParameter("country");
        String postalCode = request.getParameter("postalCode");
        String territory = request.getParameter("territory");

        if (inputNotEmpty(officeCode, city, phone, addressLine1, country, postalCode, territory)) {
            Office newOffice = new Office();
            newOffice.setOfficeCode(officeCode);
            newOffice.setCity(city);
            newOffice.setPhone(phone);
            newOffice.setAddressLine1(addressLine1);
            newOffice.setCountry(country);
            newOffice.setPostalCode(postalCode);
            newOffice.setTerritory(territory);

            boolean statusAdd = repository.insert(newOffice);

            if (statusAdd) {
                request.setAttribute("messageAdd", "Add Successfully");
                request.setAttribute("statusAdd", true);
                request.setAttribute("offices", repository.findAll());
                request.getServletContext().getRequestDispatcher("/office_list.jsp").forward(request, response);
            } else {
                request.setAttribute("messageAdd", "Add not Successful. Please check your input.");
                request.setAttribute("statusAdd", false);
                request.setAttribute("offices", repository.findAll());
                request.getServletContext().getRequestDispatcher("/office_add.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("messageAdd", "Add not Successful. Please check your input.");
            request.setAttribute("statusAdd", false);
            request.setAttribute("offices", repository.findAll());
            request.getServletContext().getRequestDispatcher("/office_list.jsp").forward(request, response);
        }
    }


    public boolean inputNotEmpty(String officeCode, String city, String phone, String addressLine1, String country, String postalCode, String territory) {
        if (officeCode != null && city != null && phone != null && addressLine1 != null && country != null && postalCode != null && territory != null &&
                !officeCode.isEmpty() && !city.isEmpty() && !phone.isEmpty() && !addressLine1.isEmpty() && !country.isEmpty() && !postalCode.isEmpty() && !territory.isEmpty()) {
            return true;
        }
        return false;
    }
}
 