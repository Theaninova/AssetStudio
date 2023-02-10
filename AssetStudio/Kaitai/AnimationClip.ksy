meta:
  id: animation_clip
  file-extension: AnimationClip
  endian: le
seq:
  - id: header
    type: header

types:
  header:
    seq:
      - id: num_cr_curves
        type: s4
      - id: cr_curves
        type: quaternion_curve
        repeat: expr
        repeat-expr: num_cr_curves
      - id: num_p_curves
        type: s4
      - id: p_curves
        type: vector3_curve
        repeat: expr
        repeat-expr: num_p_curves
      - id: num_s_curves
        type: s4
      - id: s_curves
        type: vector3_curve
        repeat: expr
        repeat-expr: num_s_curves
      - id: num_f_curves
        type: s4
      - id: f_curves
        type: float_curve
        repeat: expr
        repeat-expr: num_f_curves
      - id: sample_rate
        type: f4

  # TODO
  float_curve:
    seq:
      - id: time
        type: f4

  vector3_keyframe:
    seq:
      - id: time
        type: f4
      - id: value
        type: vector3
      - id: in_slope
        type: vector3
      - id: out_slope
        type: vector3

  vector3_curve:
    seq:
      - id: curve_count
        type: s4
      - id: keyframes
        type: vector3_keyframe
        repeat: expr
        repeat-expr: curve_count

      - id: pre_infinity
        type: s4
      - id: post_infinity
        type: s4

      - id: path_len
        type: u4
      - id: path
        type: str
        size: path_len
        encoding: UTF-8

  vector3:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
  
  quaternion_keyframe:
    seq:
      - id: time
        type: f4
      - id: value
        type: quaternion
      - id: in_slope
        type: quaternion
      - id: out_slope
        type: quaternion

  quaternion_curve:
    seq:
      - id: curve_count
        type: s4
      - id: keyframes
        type: quaternion_keyframe
        repeat: expr
        repeat-expr: curve_count

      - id: pre_infinity
        type: s4
      - id: post_infinity
        type: s4

      - id: path_len
        type: u4
      - id: path
        type: str
        size: path_len
        encoding: UTF-8

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