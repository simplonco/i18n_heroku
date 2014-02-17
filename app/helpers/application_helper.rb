module ApplicationHelper

    def language_selector


        if I18n.locale == :en
            link_to "Fr", url_for(:locale => 'fr')
        else
            link_to "Br", url_for(:locale => 'br')
            link_to "En", url_for(:locale => 'en')
        end
    end
end
