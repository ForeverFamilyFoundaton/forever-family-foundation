$(document).ready(function() {
tom();
  document.getElementById('mediumform_personalprofessional_use_fff').onclick  = function() 
  {document.getElementById('alternateinfo').innerHTML = "Professional Information";}
    document.getElementById('mediumform_personalprofessional_use_alternate').onclick  = function() 
  {document.getElementById('alternateinfo').innerHTML = "Personal Information";}
  
});

function tom(){
 var setting = document.getElementsByName('mediumform[personalprofessional]');
  if (setting[0].checked) 
  {
      document.getElementById('alternateinfo').innerHTML = "Professional Information"
  }
  else
  {
      document.getElementById('alternateinfo').innerHTML = "Personal Information"
  }
}