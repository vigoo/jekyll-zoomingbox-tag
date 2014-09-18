jekyll-zoomingbox-tag
==================

Jekyll plugin to define a tag for using [zoomingbox](http://jcf-design.com/zoomingbox/)

### Usage

1. Download and include zoomingbox

```html
<!-- zoomingbox -->
<script src="/assets/js/jquery-1.11.0.min.js"></script>
<script src="/assets/js/jquery.zoomingbox.min.js"></script>
<link href="/assets/css/zoomingbox.min.css" rel="stylesheet" />
```

2. Add the following to the end of the default layout (`default.html`):

```html
<script type="text/javascript">
  $('.zimg').zoomingBox();
</script>
```

3. Use it like

```
{% zoomingbox /assets/images/profile1.png width=600 "alt text" %}
```

- *width* and *alt text* are optional
