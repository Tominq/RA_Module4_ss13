package com.example.mvcdemo1311.serviceImp;

import com.example.mvcdemo1311.model.Customer;
import com.example.mvcdemo1311.service.ICustomerService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CustomerService implements ICustomerService {

    private List<Customer> customers = new ArrayList<>();

    public CustomerService() {
        try {
            SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
            Customer c1 = new Customer(1L, "Minq", "minh@gmail.com", "0562148582", true, sd.parse("28/03/1998"), "Default", "https://yt3.googleusercontent.com/-CFTJHU7fEWb7BYEb6Jh9gm1EpetvVGQqtof0Rbh-VQRIznYYKJxCaqv_9HeBcmJmIsp2vOO9JU=s900-c-k-c0x00ffffff-no-rj");
            Customer c2 = new Customer(2L, "Ming", "hihihi@gmail.com", "0562148582", true, sd.parse("28/08/1999"), "Default", "https://ict-imgs.vgcloud.vn/2020/09/01/19/huong-dan-tao-facebook-avatar.jpg");
            Customer c3 = new Customer(3L, "mink", "hihihi@gmail.com", "0562148582", true, sd.parse("28/06/2000"), "Default", "https://cdn.kinocheck.com/i/w=480/pmrjs5090t.jpg");
            customers.add(c1);
            customers.add(c2);
            customers.add(c3);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Customer> findAll() {
        return customers;
    }

    @Override
    public Optional<Customer> findById(Long id) {
        return customers.stream().filter(c -> c.getId().equals(id)).findFirst();
    }

    @Override
    public void save(Customer customer) {
        Customer c = findById(customer.getId()).orElse(null);
        if (c != null) {
            // if exists, update
            customers.set(customers.indexOf(c), customer);
        } else {
            // if not, add new
            customers.add(customer);
        }
    }

    @Override
    public void deleteById(Long id) {
        findById(id).ifPresent(customers::remove);
    }
}