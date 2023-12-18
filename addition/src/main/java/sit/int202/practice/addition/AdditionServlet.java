package sit.int202.practice.addition;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet(name = "AdditionServlet", value = "/addition_table")
public class AdditionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String number1Str = request.getParameter("number1");
        String number2Str = request.getParameter("number2");

        if(number1Str == null || number1Str.length() == 0 || !isNumber(number1Str)){
            request.setAttribute("error", "Invalid Missing number1 parameter");
        } else if (number2Str == null || number2Str.length() == 0 || !isNumber(number2Str)) {
            request.setAttribute("error", "Invalid Missing number2 parameter");
        }else {
            int number1 = Integer.parseInt(number1Str);
            int number2 = Integer.parseInt(number2Str);
            int sum = number1 + number2;
            request.setAttribute("result", sum);
        }
        request.getRequestDispatcher("/addition_table.jsp").forward(request,response);
    }


    private static boolean isNumber(String nStr) {
        for (int i = 0; i < nStr.length(); i++) {
            if (!Character.isDigit(nStr.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 