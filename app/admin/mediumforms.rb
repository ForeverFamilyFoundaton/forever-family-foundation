ActiveAdmin.register Mediumform do 
  menu false
  config.filters = false

  index do |mediumform|
    column :id
    column :user_id
    column :email
    column :mobile
    column :created_at, sortable: :created_at do |mediumform|
      mediumform.created_at.localtime.strftime("%B %d, %Y %H:%M")
    end
    column :updated_at, sortable: :updated_at do |mediumform|
      mediumform.updated_at.localtime.strftime("%B %d, %Y %H:%M")
    end
    actions
  end

  show do |medium|
    attributes_table do
      row :user_id
      row :personalprofessional
      row :MEPC_Removed
      row :MEPC_Failed
      row :admin_notes
      panel "ALTERNATE INFORMATION" do
        attributes_table_for medium  do
          row :alt_first_name
          row :alt_middle_name
          row :alt_last_name
          row :alt_address_line1
          row :alt_address_line2
          row :alt_city
          row :alt_state
          row :alt_zipcode
          row :alt_mobile_phone
          row :alt_home_phone
          row :alt_work_phone
          row :alt_work_email
          row :alt_home_email
        end
      end
      panel "SOCIAL MEDIA" do
        attributes_table_for medium  do
          row :website
          row :facebook
          row :pinterest
          row :instagram
          row :twitter
          row :youtube
          row :blog
        end
      end
      panel "SITTERS SET 1" do
        attributes_table_for medium  do
          row :sitter1
          row :sitter2
          row :sitter3
          row :sitter4
          row :sitter5
        end
      end
      panel "SITTERS SET 2" do
        attributes_table_for medium  do
          row :SitterA
          row :SitterB
          row :SitterC
          row :SitterD
          row :SitterE
        end
      end
      panel "OTHER ACTIVITIES" do
        attributes_table_for medium  do
          row "1) In the following space give contact information for any other businesses in which you are the primary owner:" do
            medium.other_primary_owner
          end
          row "2) Do you work in any other fields related to Health, Healing, or Spirituality? If so, please provide details:" do
            medium.other_related
          end
          row "3) Do you do work in any other fields that are NOT related to Health, Healing, or Spirituality? Please provide details:" do
            medium.other_not_related
          end
        end
      end
      panel "INTUITIVE INFORMATION" do
        attributes_table_for medium do
          row "1) When did you become aware that you were able to communicate with spirit?" do
            medium.became_aware
          end
          row "2) Do you have immediate family members with the same ability?" do
            medium.immediate_family
          end
          row "3) Did the recognition of this ability coincide with any particular event in your life? Please explain." do
            medium.life_event
          end
          row "4) Why do you wish to work with discarnate entities in the field of survival of consciousness? Is there a specific goal you hope to achieve in this work?" do
            medium.specific_goal
          end
          row "5) As a medium, is your first priority to bring forth evidence of survival or messages of love? Explain why." do
            medium.medium_priority
          end
          row "6) What is the difference between information received psychically and information received from a discarnate entity?" do
            medium.different_info
          end
        end
      end
      panel "PROFESSIONAL INFORMATION" do
        attributes_table_for medium do
          row "1) How did you hear about Forever Family Foundation’s Medium Evaluation Certification Process?" do
              medium.hear_about_fff
          end
          row "2) Have you been working as a medium full time? If so, for how long? If you are not working as a medium full time, please explain why, and if you have plans to do so in the future" do
            medium.medium_history
          end
          row " " do
            table_for medium.practice_preferences do
              column "3) What kind of readings do you offer in your practice?" do |question|
                question.name
              end
            end
            #medium.life_event
          end
          row " " do
            table_for medium.selfclassify_preferences do
              column "4) How do you classify yourself as a professional?" do |question|
                question.name
              end
            end
            medium.other_classify
          end

          row "5) Have you ever received formal education, training, or mentorship in Mediumship?" do
            medium.mediumship_training
          end
  
          row "6) Are you certified with any other organizations?  If so, please provide details." do
            medium.other_certification
          end
        end
      end

      panel "ETHICS QUESTIONNAIRE" do
        attributes_table_for medium do
          row "1) How do you handle a situation where you are engaged in providing your services to a sitter and no communication or information is coming through?" do
            medium.ethics1
          end
          row "2) If you were conducting a reading and received dire information about the sitter’s health or possible demise, would you communicate this information to the sitter? If so, in what way?" do
            medium.ethics2
          end
          row "3) If you were in public and received information from a spirit that belonged to a complete stranger, what would you do with that information?" do
            medium.ethics3
          end
          row "4) Have you offered your time without pay to any organizations, particularly not-for-profit organizations, in order to benefit the greater good?" do
            medium.ethics4
          end
        end
      end
      panel "SIGNATURE" do
        attributes_table_for medium do
          row :signature
          row :signature_checkbox
        end
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :user_id, input_html: {disabled: true}
      f.input :personalprofessional
      f.input :MEPC_Removed, start_year: 2017
      f.input :MEPC_Failed, start_year: 2017
      f.input :admin_notes
      f.inputs 'Alternate Information' do
        f.input :alt_first_name
        f.input :alt_middle_name
        f.input :alt_last_name
        f.input :alt_address_line1
        f.input :alt_address_line2
        f.input :alt_city
        f.input :alt_state
        f.input :alt_zipcode
        f.input :alt_mobile_phone
        f.input :alt_work_phone
        f.input :alt_email
      end
      # f.inputs 'Personal Alternative' do
      #   f.input :use_personal
      #   f.input :personal_name
      #   f.input :personal_address_line1
      #   f.input :personal_address_line2
      #   f.input :personal_phone_number
      #   f.input :personal_email
      # end
      f.inputs 'SOCIAL MEDIA' do
        f.input :website, :input_html => {:rows => 1}
        f.input :facebook, :input_html => {:rows => 1}
        f.input :pinterest, :input_html => {:rows => 1}
        f.input :instagram, :input_html => {:rows => 1}
        f.input :twitter, :input_html => {:rows => 1}
        f.input :youtube, :input_html => {:rows => 1}
        f.input :blog, :input_html => {:rows => 1}
      end
      f.inputs 'SITTERS SET 1' do
        f.input :sitter1
        f.input :sitter2  
        f.input :sitter3
        f.input :sitter4
        f.input :sitter5
      end

      f.inputs 'SITTERS SET 2' do
        f.input :SitterA
        f.input :SitterB  
        f.input :SitterC
        f.input :SitterD
        f.input :SitterE
      end
      
      f.inputs "OTHER ACTIVITIES"  do
        f.label "1) In the following space give contact information for any other businesses in which you are the primary owner:"
        f.input :other_primary_owner
        f.label "2) Do you work in any other fields related to Health, Healing, or Spirituality? If so, please provide details:" 
        f.input :other_related
        f.label "3) Do you do work in any other fields that are NOT related to Health, Healing, or Spirituality? Please provide details:"
        f.input :other_not_related
      end

      f.inputs "INTUITIVE INFORMATION"  do
        f.label "1) When did you become aware that you were able to communicate with spirit?" 
        f.input :became_aware
        f.label "2) Do you have immediate family members with the same ability?"
        f.input :immediate_family
        f.label "3) Did the recognition of this ability coincide with any particular event in your life? Please explain."
        f.input :life_event
        f.label "4) Why do you wish to work with discarnate entities in the field of survival of consciousness? Is there a specific goal you hope to achieve in this work?" 
        f.input :specific_goal
        f.label "5) As a medium, is your first priority to bring forth evidence of survival or messages of love? Explain why."
        f.input :medium_priority
        f.label "6) What is the difference between information received psychically and information received from a discarnate entity?"
        f.input :different_info
      end

      f.inputs "PROFESSIONAL INFORMATION" do
        f.label "1) How did you hear about Forever Family Foundation’s Medium Evaluation Certification Process?"
        f.input :hear_about_fff
        f.label "2) Have you been working as a medium full time? If so, for how long? If you are not working as a medium full time, please explain why, and if you have plans to do so in the future"
        f.input :medium_history
        f.label "3) What kind of readings do you offer in your practice?"
        f.input :mediumform_preferences, as: :check_boxes, collection: MediumformPreference.practice_preferences
        f.label "4) How do you classify yourself as a professional?"
        f.input :mediumform_preferences, as: :check_boxes, collection: MediumformPreference.selfclassify_preferences
        f.label "5) Have you ever received formal education, training, or mentorship in Mediumship?"
        f.input :mediumship_training
        f.label "6) Are you certified with any other organizations?  If so, please provide details." 
        f.input :other_certification
      end

      f.inputs 'ETHICS' do
        f.label "1) How do you handle a situation where you are engaged in providing your services to a sitter and no communication or information is coming through?"
        f.input :ethics1
        f.label "2) If you were conducting a reading and received dire information about the sitter’s health or possible demise, would you communicate this information to the sitter? If so, in what way?"
        f.input :ethics2
        f.label "3) If you were in public and received information from a spirit that belonged to a complete stranger, what would you do with that information?"
        f.input :ethics3
        f.label "4) Have you offered your time without pay to any organizations, particularly not-for-profit organizations, in order to benefit the greater good?"
        f.input :ethics4
      end

      f.inputs 'SIGNATURE' do
        f.input :signature
        f.input :signature_checkbox
      end
    end
    f.actions
  end
end

