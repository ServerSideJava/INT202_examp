package sit.int202.classicmodels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.repositories.OfficeRepository;

import java.io.*;

@WebServlet(name = "OfficeDeleteServlet", value = "/office-delete")
public class OfficeDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeRepository repository = new OfficeRepository();
        String officeCode = request.getParameter("officeCode");
        if (officeCode != null) {
            boolean statusDelete = repository.delete(officeCode);
            if (statusDelete) {
                request.setAttribute("messageDelete", "Delete Successfully");
                request.setAttribute("StatusDelete", true);
            } else {
                request.setAttribute("messageDelete", "Delete not Successful");
                request.setAttribute("StatusDelete", false);
            }
        }
        request.setAttribute("offices", repository.findAll());
        request.getServletContext().getRequestDispatcher("/office_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
 