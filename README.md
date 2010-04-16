CSS Naked Day Plugin for Rails
==============================

CSS Naked Day is an annual event where websites remove all CSS from their
site for one day to promote web standards. More information on this event
can be found on [Dustin's site][dustin].

This plugin makes a Rails application strip off the stylesheets during the
CSS Naked Day event. It does this by modifying the `stylesheet_link_tag`
helper to skip including stylesheets into the layout during the event.

Install
-------

Just install the plugin and you're ready to go.

    # ruby script/plugin install git://github.com/zargony/css_naked.git

Manual usage
------------

If you manually need to do stuff on CSS Naked Day (e.g. skipping stylesheets
you placed without using `stylesheet_link_tag` or adding a note for visitors
why the stylesheets are missing), you can use the `css_naked?` method:

    <%- if css_naked? -%>
      <h3>What happened to the design?</h3>
      <p>To know more about why styles are disabled on this website visit the
      <a href="http://naked.dustindiaz.com" title="Web Standards Naked Day Host Website">
      Annual CSS Naked Day</a> website for more information.</p>
    <%- end -%>

Trying it out
-------------

To see, how your site will look like without any styles, you can manually activate
the CSS Naked Day mode by overriding the `css_naked?` in `application_helper.rb`:

    def css_naked?
      true
    end

Author
------
[Andreas Neuhaus](http://zargony.com/)

[dustin]: http://naked.dustindiaz.com
