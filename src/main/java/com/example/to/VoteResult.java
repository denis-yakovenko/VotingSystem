package com.example.to;

import com.example.model.Restaurant;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class VoteResult implements Serializable {

    private final Restaurant restaurant;

    private final Long votes;

    public VoteResult(@JsonProperty("restaurant") Restaurant restaurant,
                      @JsonProperty("votes") Long votes) {
        this.restaurant = restaurant;
        this.votes = votes;
    }

    public Restaurant getRestaurant() {return restaurant;}

    public Long getVotes() {return votes;}

    @Override
    public String toString() {
        return "VoteResult{" +
                "restaurant=" + restaurant +
                ", votes=" + votes +
                '}';
    }
}
