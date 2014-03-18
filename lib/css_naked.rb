#
# This Rails plugin overrides the stylesheet_link_tag helper and modifies
# it to skip outputting stylesheet link tags on css naked day. Css naked
# day is an annual event where websites remove all css from their site to
# promote web standards. See http://naked.threepixeldrift.com for more info.
#
module CssNaked
  module ViewHelpers
    class << self
      def included (base) # :nodoc:
        base.class_eval do
          alias_method_chain :stylesheet_link_tag, :css_naked
        end
      end
    end

    # Returns true if today is a css naked day (April 9th in any timezone)
    # Previous naked days: 2006-04-05, 2007-04-05, 2008-04-09, 2009-04-09,
    # 2010-04-09. Since 2008, all future naked days will be on April 9th.
    # See also http://naked.threepixeldrift.com/
    def css_naked?
      start = Date.new(Time.current.year, 4, 9).to_time(:utc) - 12.hours
      Time.current >= start && Time.current <= start + 47.hours
    end

    # Modified stylesheet_link_tag that does nothing on css naked day
    def stylesheet_link_tag_with_css_naked (*args)
      stylesheet_link_tag_without_css_naked(*args) unless css_naked?
    end
  end
end

ActionView::Base.send :include, CssNaked::ViewHelpers
