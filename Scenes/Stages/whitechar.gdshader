shader_type canvas_item;

void fragment() {
    // Sample the original texture color
    vec4 original_color = texture(TEXTURE, UV);
    COLOR = vec4(1.0, 1.0, 1.0, original_color.a);
    
}