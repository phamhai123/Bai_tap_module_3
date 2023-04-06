package com.example.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = String.valueOf(request.getParameter("description"));
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));
        float amount = (float) (price * percent * 0.01);
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h2>Description:" + description + "</h2>");
        writer.println("<h2>Discount Amount:" + amount + "</h2>");
        writer.println("</html>");
    }
}
