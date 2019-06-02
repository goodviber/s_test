# Simplybusiness tech test

A car insurance aggregator wants to build a system that returns insurance quotes based on customer requests.

A customer can request a level of cover for various parts of a car, e.g. they  may want £10 cover for their tires and £50 cover for their windows.

Based on the customer request, quots are provided by a panel of insurers. Each quote can have a different price, e.g. insurer_a may give a quote for £10 for the request above, and insurer_b may give a quote of £15. The rules for coming up with the price a specified below.

# What to build

Build an application that produces insurer quotes based on customer requests.

This is an example of a customer request in a JSON format:

{
    "covers": {
        "tires" : 10,
        "windows" : 50,
        "engine" : 20,
        "contents : 30,
        "doors" : 15
    }
 }
 
 The JSON request specifies which values the customer is requesting for 5 possible covers.
 
 The application uses a static configuration file which contains the list of the covers each insrer is providing.
 
 This is an example of the insurer configuration JSON file.
 
 {
    "insurer_rates" : {
        "insurer_a" : "windows+contents",
        "insurer_b" : "tires+contents",
        "insurer_c" : "doors+engine"
    }
  }
  
The application should, for each request, calculate quotes for the 3 insurers. The business requirement for the pricing model is as follows:
  
The quote is 10% of the insurer rate if 2 covers are matched. If only 1 cover is matched, the quote is 20% of the insurer rate if it is the highest cover requested, 25% if it is the second highest, or 30% if it is the third.

Only the biggest insoming 3 values from the customer request are taken into account for the calculation, discarding the other 2.

The system should not return quote if the value is zero.

# Example

Assume the following customer request:

{
    "covers": {
        "tires" : 10,
        "windows" : 50,
        "engine" : 20,
        "contents : 30,
        "doors" : 15
    }
 }
 
 The application will select the 3 biggest covers and ignore the rest:
 
 * windows : 50
 * contents : 30
 * engine : 20
 
 The application will then calculate the following quotes:
 
 * insurer_a : 8 (10% of 80 (two matches on windows and contents))
 * insurer_b : 7.5 (25% of 30 (one match on contents, the second biggest cover))
 * insurer_c : 6 (30% of 20 (one match on engine, the third biggest cover))
 
 
  
     
