package int202.mid.exam.mid_exam_041.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
// 65130500041
@WebServlet(name = "IsPrime", value = "/041/is_prime")
public class IsPrime extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int number = Integer.parseInt(request.getParameter("number"));
        boolean flag = false;
        for (int i = 2; i <= number / 2; ++i) {
            if (number % i == 0) {
                flag = true;
                break;
            }
        }

        if(!flag ){
            request.setAttribute("message", number + "is invalid input");
        } else {
            request.setAttribute("message", number + "is a prime number");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 