{%- extends 'null.tpl' -%}

{%- block header -%}
# ---
# jupyter:
#   kernelspec:
#     display_name: Julia 1
#     language: julia
#     name: julia-1.0
#   language_info:
#     file_extension: .jl
#     mimetype: application/julia
#     name: julia
#     version: 1.0.2
# ---
{% endblock header %}

{% block markdowncell scoped %}
{{ cell.source | comment_lines }}
{% endblock markdowncell %}


## remove code cells
{% block codecell %}
{% endblock codecell %}


