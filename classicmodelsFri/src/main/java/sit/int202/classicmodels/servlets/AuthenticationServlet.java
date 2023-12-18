package sit.int202.classicmodels.servlets;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.repositories.CustomerRepository;

import java.io.*;
// urlPatterns = ได้ทุกแบบ
@WebServlet(name = "AuthenticationServlet", value = "/login")
public class AuthenticationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              // ไม่ใช้
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String userName = request.getParameter("userName");
        if (userName == null || userName.trim().length() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = customerRepository.findByName(userName);
        if (customer == null) {
            response.addHeader("error", "User account '" + userName + "' does not exist !!");
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        } else {
            Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2d, 16, 16);
            char[] passwordArray = password.toCharArray();

            boolean isOk = argon2.verify(customer.getPassword(), passwordArray);
            if (!isOk ) {
                response.addHeader("error", "Incorrect password ... try again");
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            } else {
                request.getSession().setAttribute("user", customer);
            }

        }
    }
}
 