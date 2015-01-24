afwrap-xdatetime
================

This is a wrap over the [xdatetime](https://github.com/miguelalarcos/xdatetime) package to work with ```AutoForm```.

Explanation
-----------

Examples:

```html
{{#autoForm id="id1" doc=this type='method' meteormethod='save' schema='dateSchema'}}
    <div>{{> afFieldInput  type='xdatetime' formid="id1" name='datetime1' time='true' format='DD-MM-YYYY HH:mm'}}</div>
    <div>{{> afFieldInput  type='xdatetime' formid="id1" name='datetime2' format='DD-MM-YYYY'}}</div>
{{/autoForm}}
```

In the examples folder you have a working example and a battery of tests with ```Jasmine```.