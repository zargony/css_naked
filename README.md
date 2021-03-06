# CSS Naked Day Plugin for Rails

CSS Naked Day is an annual event where websites remove all CSS from their
site for one day to promote web standards. More information on this event
can be found on the [CSS Naked Day homepage][homepage].

This plugin makes a Rails application strip off the stylesheets during the
CSS Naked Day event. It does this by modifying the `stylesheet_link_tag`
helper to skip including stylesheets into the layout during the event.

## Install

Add the css_naked gem to your Rails application. With Rails 3.x, add the
following to you `Gemfile`:

    gem 'css_naked'

If you're using Rails 2.x without Bundler, you need to add `config.gem 'css_naked'`
to `config/environments.rb` instead.

## Manual usage

If you manually need to do stuff on CSS Naked Day (e.g. skipping stylesheets
you placed without using `stylesheet_link_tag` or adding a note for visitors
why the stylesheets are missing), you can use the `css_naked?` method:

    <%- if css_naked? -%>
      <h3>What happened to the design?</h3>
      <p>To know more about why styles are disabled on this website visit the
      <a href="http://naked.threepixeldrift.com" title="Web Standards Naked Day Host Website">
      Annual CSS Naked Day</a> website for more information.</p>
    <%- end -%>

## Trying it out

To see, how your site will look like without any styles, you can manually activate
the CSS Naked Day mode by overriding the `css_naked?` in `application_helper.rb`:

    def css_naked?
      true
    end

## Author

Andreas Neuhaus - [zargony.com](http://zargony.com/)


[homepage]: http://naked.threepixeldrift.com
