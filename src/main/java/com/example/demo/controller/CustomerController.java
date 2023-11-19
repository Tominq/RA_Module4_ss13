package com.example.mvcdemo1311.controller;

import com.example.mvcdemo1311.model.Customer;
import com.example.mvcdemo1311.service.ICustomerService;
import com.example.mvcdemo1311.serviceImp.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "CustomerController", value = "/CustomerController")
public class CustomerController extends HttpServlet {
    private SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request, response);
        } else {
            switch (action) {
                case "FINDALL":
                    showListCustomer(customerService.findAll(), request, response);
                    break;
                case "ADD":
                    request.getRequestDispatcher("/WEB-INF/views/customer/add-customer.jsp").forward(request, response);
                    break;
                case "EDIT":
                    Long idEdit = Long.parseLong(request.getParameter("id"));
                    Optional<Customer> optionalCustomer = customerService.findById(idEdit);
                    optionalCustomer.ifPresent(c -> {
                        request.setAttribute("customer", c);
                        try {
                            request.getRequestDispatcher("/WEB-INF/views/customer/edit-customer.jsp").forward(request, response);
                        } catch (ServletException | IOException e) {
                            throw new RuntimeException(e);
                        }
                    });
                    break;
                case "DELETE":
                    Long idDel = Long.parseLong(request.getParameter("id"));
                    customerService.deleteById(idDel);
                    showListCustomer(customerService.findAll(), request, response);
                    break;
            }
        }
    }

    protected void showListCustomer(List<Customer> list, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", list);
        request.getRequestDispatcher("/WEB-INF/views/customer/list-customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request, response);
        } else {
            switch (action) {
                case "ADD":
                case "UPDATE":
                    // Retrieve all input data
                    Long idNew = Long.parseLong(request.getParameter("id"));
                    String nameNew = request.getParameter("name");
                    String emailNew = request.getParameter("email");
                    String phoneNew = request.getParameter("phone");
                    String bioNew = request.getParameter("bio");
                    String avtNew = request.getParameter("avt");
                    boolean genderNew = Boolean.parseBoolean(request.getParameter("gender"));
                    Date dobNew = null;
                    try {
                        dobNew = sim.parse(request.getParameter("dob"));
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                    Customer customer = new Customer(idNew, nameNew, emailNew, phoneNew, genderNew, dobNew, bioNew, avtNew);
                    customerService.save(customer);
                    showListCustomer(customerService.findAll(), request, response);
                    break;
            }
        }
    }
}