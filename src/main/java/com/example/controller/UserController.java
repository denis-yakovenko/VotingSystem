package com.example.controller;

import com.example.dao.UserRepository;
import com.example.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.net.URI;
import java.util.List;

import static com.example.Util.API_V1;
import static com.example.ValidationUtil.checkNotFoundWithId;

@PreAuthorize("hasRole('ROLE_ADMIN')")
@RestController
@RequestMapping(value = API_V1 + "/users")
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public List<User> getAll(){
        return userRepository.findAll();
    }

    @GetMapping("/{id}")
    public User get(@PathVariable("id") Integer id){
        return checkNotFoundWithId(userRepository.findOne(id), id);
    }

    @PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public User update(@PathVariable("id") Integer id, @Valid @RequestBody User user){
        Assert.notNull(user, "user must not be null");
        return checkNotFoundWithId(userRepository.save(user), id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> create(@Valid @RequestBody User user){
        Assert.notNull(user, "user must not be null");
        User created = userRepository.save(user);
        URI uri = ServletUriComponentsBuilder
                .fromCurrentContextPath()
                .path("/users" + "/{id}")
                .buildAndExpand(created.getId())
                .toUri();
        return ResponseEntity.created(uri).body(created);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id){
        Assert.notNull(id, "user must not be null");
        checkNotFoundWithId(userRepository.findOne(id), id);
        userRepository.delete(id);
    }

}
