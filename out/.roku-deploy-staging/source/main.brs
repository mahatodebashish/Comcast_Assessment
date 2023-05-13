

sub Main()

    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    scene = screen.CreateScene("MainScene")' TestScreen1


    m.global = screen.getGlobalNode()  
    m.global.id = "GlobalNode"
    m.global.addFields( {titleScreenA: "", numberSetA: [] , numberSetB: [], titleScreenB: "", logoA: "" , logoB:"" } ) 

   
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://api.jsonbin.io/v3/b/645e58c0b89b1e22999c58f9")
    xfer.AddHeader("X-Access-Key", "$2b$10$SA7OMom8/b82Y21D8l3PRe.E7v/BvtBsB.eq44I6BQsI/kLfPJB7a")

    rsp = xfer.GetToString()
   ' print rsp

    json=ParseJson(rsp)

    m.global.titleScreenA=json.record.record.ScreenA.title
    m.global.titleScreenB=json.record.record.ScreenB.title
    m.global.logoA=json.record.record.ScreenA.logo
    m.global.logoB=json.record.record.ScreenB.logo
   
   json.record.record.ScreenA.numberSet.Sort("r")
   json.record.record.ScreenB.numberSet.Sort("r")

   m.global.numberSetA=json.record.record.ScreenA.numberSet
   m.global.numberSetB=json.record.record.ScreenB.numberSet
   'print Type(json.record.record.ScreenA.numberSet)

    screen.show()

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub


