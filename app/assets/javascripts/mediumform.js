$(document).ready(function() {
tom();
  document.getElementById('mediumform_personalprofessional_fff_is_professional').onclick  = function() 
  {document.getElementById('alternateinfo').innerHTML = "Personal Information";}
    document.getElementById('mediumform_personalprofessional_alternate_is_professional').onclick  = function() 
  {document.getElementById('alternateinfo').innerHTML = "Professional Information";}
  
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