Input = {}

Input.keypressed = {}
Input.mousePressed = {}



function Input:wasPressed(key)
  return Input.keypressed[key]
end

function Input:mouseWasPressed(button)
  return Input.mousePressed[button]
end