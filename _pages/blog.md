---
title: Blog
permalink: /blog/index.html
---
<ul>
    {% for post in site.posts %}
    {% if post.type == 'blog' %}
    <li>
        <a href="{{ post.url }}">
            {{ post.title }}
        </a>
    </li>
    {% endif %}
    {% endfor %}
</ul>