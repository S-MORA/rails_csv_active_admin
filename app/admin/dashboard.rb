ActiveAdmin.register_page "Dashboard" do

  controller do
    def download
      send_file "#{Rails.root}/public/csv/#{params[:file_name]}"
    end

    def show_csv
       @csv_table = CSV.open("public/csv/#{params[:file_name]}", :headers => true).read
    end

    def upload_csv
      CsvUpload.convert_save(params[:dump][:file])
    end
  end

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end

    end

    columns do
      column do
        panel "CSV Uploader and List" do
          ul do
           render 'admin/dashboard/upload_csv'
          end
           Dir.entries("public/csv")[2..-1].each do |file_name|
            div do
              span do                            #2..-1 first two will be ".", ".."
               "#{file_name}:"
              end
              span do
               link_to "Download", download_path(:file_name => file_name)
              end
              span do
               link_to "View", show_csv_path(:file_name => file_name)
              end
             end
            end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
