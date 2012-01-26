Deface::Override.new(:virtual_path => 'shared/_store_menu',
                     :name => 'remove_home_link_on_menu',
                     :remove => "#home-link")

Deface::Override.new(:virtual_path => 'shared/_nav_bar',
                     :name => 'add_static_content_menu',
                     :insert_before => "#search-bar",
                     :text => "<li id='home-link' data-hook><%= link_to t(:home), root_path %></li>
                               <% Page.header_links.each do |page| %>
                                <%= raw('<li>'+link_to(page.title, page.link)+'</li>') %>
                               <% end %>")

Deface::Override.new(:virtual_path => "layouts/spree_application",
                     :name => "add_static_content_footer",
                     :replace_contents => "#footer-left[data-hook]",
                     :text => "<% Page.footer_links.each do |page| %>
                                <%= link_to(page.title, page.link) %>
                               <% end %>")

Deface::Override.new(:virtual_path => 'layouts/spree_application',
                     :name => 'add_static_content_menu_on_sidebar',
                     :insert_bottom => "#sidebar",
                     :text => "<ul class='navigation-list'>
                                  <li class='root'> <h3 class='name'>Informations</h3> </li>
                                  <% Page.sidebar_links.each do |page| %>
                                    <li class='second_children <%== 'current' if page == @page %>'>
                                      <h4 class='name'><%= link_to page.title, page.link %></h4>
                                    </li>
                                  <% end %>
                                </ul>")
