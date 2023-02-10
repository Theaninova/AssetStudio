# for 2.5f only
meta:
  id: mesh
  file-extension: Mesh
  endian: le
seq:
  - id: header
    type: header

types:
  header:
    seq:
      - id: use_16bit_indicies
        type: u4
      - id: index_buffer_size
        type: s4
      - id: index_buffer
        type:
          switch-on: use_16bit_indicies
          cases:
            0: s4
            _: u2
        repeat: expr
        repeat-expr: index_buffer_size / (use_16bit_indicies == 0 ? 4 : 2)
      - id: sub_meshes_size
        type: s4
      - id: sub_meshes
        type: sub_mesh
        repeat: expr
        repeat-expr: sub_meshes_size
      - id: vertex_count
        type: s4
      - id: vertices
        type: vector3
        repeat: expr
        repeat-expr: vertex_count
      - id: skin_count
        type: u4
      - id: skin
        type: bone_weights
        repeat: expr
        repeat-expr: skin_count
      # - id: bind_pose_count
      #   type: u4
      # - id: bind_pose
      #   type: matrix_4x4
      #   repeat: expr
      #   repeat-expr: bind_pose_count
      - id: uv0_count
        type: u4
      - id: uv0
        type: vector2
        repeat: expr
        repeat-expr: uv0_count
      - id: uv1_count
        type: u4
      - id: uv1
        type: vector2
        repeat: expr
        repeat-expr: uv1_count
      - id: tangent_space_size
        type: u4
      - id: normals
        type: vector3
        repeat: expr
        repeat-expr: tangent_space_size
      - id: tangents
        type: quaternion
        repeat: expr
        repeat-expr: tangent_space_size
      - id: handedness_normal
        type: vector3
        doc: may be added to the normals array
      - id: handedness_tangent
        type: quaternion
        doc: may be added to the tangents array
      # - id: aabb_local_aabb
      #   doc: no idea what this does but we skip it
      #   size: 24
      - id: colors_size
        type: u4
      - id: colors
        type: color_alpha
        repeat: expr
        repeat-expr: colors_size
      # - id: collision_triangles_size
      #   type: u4
      # - id: collision_triangles_indices
      #   type: u4
      #   repeat: expr
      #   repeat-expr: collision_triangles_size
      # - id: collision_vertex_count
      #   type: u4
      # - id: collision_vertex_indices
      #   type: u4
      #   repeat: expr
      #   repeat-expr: collision_vertex_count
      - id: mesh_use_flags
        type: u4
  
  vector2:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
  
  vector3:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
  
  quaternion:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
      - id: w
        type: f4
  
  color_alpha:
    seq:
      - id: r
        type: u1
      - id: g
        type: u1
      - id: b
        type: u1
      - id: a
        type: u1
  
  bone_weights:
    seq:
      - id: weight
        type: f4
        repeat: expr
        repeat-expr: 4
      - id: bone_index
        type: s4
        repeat: expr
        repeat-expr: 4
  
  matrix_4x4:
    seq:
      - id: matrix
        type: s4
        repeat: expr
        repeat-expr: 16
  
  sub_mesh:
    seq:
      - id: first_byte
        type: u4
      - id: index_count
        type: u4
      - id: topology
        type: u4
        enum: gfx_primitive_type
      - id: triangle_count
        type: u4
    enums:
      gfx_primitive_type:
        0: triangles
        1: triangle_strip
        2: quads
        3: lines
        4: line_strip
        5: points
        
