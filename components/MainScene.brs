sub init()
     m.top.SetFocus(true)
     m.top.backgroundColor = "#D3D3D3" 
     m.top.backgroundURI = ""

End sub






function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
      if (key = "back") then
        handled = false
        return false

        else
          if (key = "OK") then
            
            if   m.top.findNode("screenA").visible=true

             
              m.top.backgroundColor = "#FF0000"  
              m.top.backgroundURI = ""

            m.top.findNode("screenA").visible="false"
            m.top.findNode("screenB").visible="true"
           
            else

              m.top.backgroundColor = "#D3D3D3" 
              m.top.backgroundURI = ""
            
              m.top.findNode("screenA").visible="true"
              m.top.findNode("screenB").visible="false"

            end if


           handled=true
          
          end if
        end if
        handled=true
      end if
    return handled
  
end function