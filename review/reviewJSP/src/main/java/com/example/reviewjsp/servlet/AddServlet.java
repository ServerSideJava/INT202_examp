package com.example.reviewjsp.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet(name = "AddServlet", value = "/AddServlet")
public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input1 = request.getParameter("num1");
        String input2 = request.getParameter("num2");

        if (input1 == null || input1.isEmpty() || input2 == null || input2.isEmpty()) {
            request.setAttribute("error", "Please enter valid input");
        } else {
            int num1 = Integer.parseInt(input1);
            int num2 = Integer.parseInt(input2);
            int sum = num1 + num2;
            request.setAttribute("result", sum);
        }

        request.getRequestDispatcher("/add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 