---
title: Reviews
permalink: /reviews/index.html
---
<ul>
    {% for post in site.posts %}
    {% if post.type == 'review' %}
    <li>
        <a href="{{ post.url }}">
            {{ post.title }}
        </a>
    </li>
    {% endif %}
    {% endfor %}
</ul>