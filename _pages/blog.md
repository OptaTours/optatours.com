---
title: Blog
permalink: /blog/index.html
---
<ul>
    {% for post in site.posts %}
    <li>
        <a href="{{ post.url }}">
            {{ post.title }}
        </a>
    </li>
    {% endfor %}
</ul>