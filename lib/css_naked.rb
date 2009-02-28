module CssNaked
  module ViewHelpers
    class << self
      def included (base)
        base.class_eval do
          alias_method_chain :stylesheet_link_tag, :css_naked
        end
      end
    end

    # Previous naked days: 2006-04-05, 2007-04-05, 2008-04-09
    # Current naked day: 2009-04-09
    # Future naked days unfortunately have to be updated manually
    # since there's no strict rule to determine the exact date.
    # See also http://naked.dustindiaz.com/
    @@css_naked_date = Date.new(2009, 4, 9).to_time(:utc).freeze

    # Returns true if today is a CSS-naked-day
    def css_naked?
      Time.current >= @@css_naked_date - 12.hours && Time.current <= @@css_naked_date + 35.hours
    end

    # Modified stylesheet_link_tag that does nothing on CSS-naked-day
    def stylesheet_link_tag_with_css_naked (*args)
      stylesheet_link_tag_without_css_naked(*args) unless css_naked?
    end
  end
end

ActionView::Base.send :include, CssNaked::ViewHelpers
