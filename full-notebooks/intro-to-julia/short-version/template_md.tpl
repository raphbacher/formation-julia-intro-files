{%- extends 'markdown.tpl' -%}

{% block output_area_prompt %}
{% endblock output_area_prompt %}

{% block in_prompt %}
{% endblock in_prompt %}

{% block input %}
<div class="input_area">
	{{ super() }}
</div>
{% endblock input %}


