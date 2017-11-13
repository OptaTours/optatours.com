---
title:  "Cut Tour Costs and Automate Scheduling with Mixed Integer / Linear Programming"
excerpt: "Sometimes it's just too difficult to optimize how many tour runnings you should allocate to the schedule . Here's a cool technique you can try!"
page_code_ref: optimize-tour-resources-part-1
type: blog

categories: tourism optimization
tags: milp-programming linear-programming integer-programming resource-allocation auto-schedule ampl
---

{% include toc %}

# Intro
Sometimes it's just too difficult to optimize how many tour
runnings you should allocate to the schedule for your client
bookings. Here's a cool technique you can try out to help
automate the management of this textbook resource-allocation
problem.

## Scenario
Imagine the company has hourly runnings of 5 different
tours with only 10 guides to serve hundreds of clients
who booked different tour times throughout the day.
That's a lot of work! Let's try to compute the least expensive
way to run these tours.

## The Logic! Mixed Integer / Linear Programming
Mixed Integer / Linear Programming involves using an
algebraic modeling language to define an objective you'd
like to optimize for. An example of this would be to
calculate the variables required to maximize profit,
or in our case, calculate the number of tour runnings
to minimize cost.

This is followed by defining a number of integer or linear
constraints. Examples of constraints could be as simple
as setting the maximum number of clients that are allowed
on a tour or as complicated as committing to an HR strategy that
attempts to appeal to Tour Guides by promising a minimum
number of tours if they contract with the company.

All this is completed by sending the newly designed data
model to a solver to compute. A good solver can easily
compute a model with hundreds of thousands of constraints
(this is useful for optimizing resources for individualized
custom tours).

# Optimize
This post assumes at least some familiarity with AMPL.

## Data
For this example, the company has 5 different
tours that can potentially run every hour. We also
have 10 tour guide contractors on staff and
their work schedule/availability is all defined in this
data file:

{% highlight matlab linenos %}
{% include {{ page.page_code_ref }}/tour_resources.dat %}
{% endhighlight %}

## Define Sets, Parameters, and Variables
First things first! We need to set up our
parameters and variables.

For our example, a tour cost $50 USD to run and a tour
guide charges us $100 USD to work the tour.

In our market, 23 clients on a tour are the maximum number
of bodies we can effectively handle on a tour while maintaining
our 5-star rating on a typical tour rating website.

We define all this in a model file as so:

{% highlight matlab linenos %}
{% include {{ page.page_code_ref }}/tour_headers.mod %}
{% endhighlight %}

## Define Objective Function

For our example, we want to minimize the cost to run our
tour operations.

The cost to run Tour Operations for us is defined by adding
all the tour costs and guide costs for each time slot we
operate our tours.

{% highlight matlab linenos %}
{% include {{ page.page_code_ref }}/tour_objective.mod %}
{% endhighlight %}

## Define Constraints

The least expensive way to run a tourism company is to not
run any tours but that's not good for business...

To deal with this, we need to define some operating constraints.

{% highlight matlab linenos %}
{% include {{ page.page_code_ref }}/tour_constraints.mod %}
{% endhighlight %}

## Run

Running this will return $4,650 as the minimum cost
it will take to run tour operations for the day, the
schedule for tour runnings, and the schedule for
the team of tour guides.

Here's part of the output:

{% highlight matlab linenos %}
{% raw %}
:     Tour1 Tour2 Tour3 Tour4 Tour5    :=
10-11    3     1     1     0     0
11-12    1     1     1     0     0
12-13    0     1     1     1     0
13-14    0     1     1     0     1
14-15    0     0     1     0     1
15-16    0     0     0     1     1
16-17    0     0     0     2     1
8-9      4     1     0     0     0
9-10     3     2     0     0     0
;

# Guide Schedule removed to make room...

TourOperationsCost = 4650

{% endraw %}
{% endhighlight %}

# Conclusion

Operations Research is a super awesome field that's far
underutilized in many industries.