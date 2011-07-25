---
layout: default
title: Fajar Nurdiansyah
---
<h1>Archive</h1>
{% for post in site.posts %}
    <div>		
		<div>
		{% if post.link == null %}
			<div class="archivedate">
                {{post.date | date: "%Y-%m-%d"}} 
            </div>
            <div class="archivepost">
                <h3 style="">{% if post.link %}<a href="{{post.link}}">→</a>{% endif %}<a href="{{post.url}}">{{ post.title }}</a></h3>
                {% if post.intro %}
                    <div style="float:left; font-size: 80%;">
                        {{post.intro}}
                    </div>
                {% endif %}
            </div>
        {% endif %}
		</div>		
	</div>
{% endfor %}
