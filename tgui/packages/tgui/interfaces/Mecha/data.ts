import { BooleanLike } from 'common/react';

<<<<<<< HEAD
import { Region } from '../common/AccessConfig';
=======
export const KelvinZeroCelcius = 273.15;

export const InternalDamageToDamagedDesc = {
  MECHA_INT_FIRE: 'Internal fire detected',
  MECHA_INT_TEMP_CONTROL: 'Temperature control inactive',
  MECHA_INT_TANK_BREACH: 'Air tank breach detected',
  MECHA_INT_CONTROL_LOST: 'Control module damaged',
};

export const InternalDamageToNormalDesc = {
  MECHA_INT_FIRE: 'No internal fires detected',
  MECHA_INT_TEMP_CONTROL: 'Temperature control active',
  MECHA_INT_TANK_BREACH: 'Air tank intact',
  MECHA_INT_CONTROL_LOST: 'Control module active',
};
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

export type AccessData = {
  name: string;
  number: number;
};

export type MainData = {
  isoperator: BooleanLike;
  ui_theme: string;
  name: string;
  integrity: number;
  integrity_max: number;
  power_level: number;
  power_max: number;
  mecha_flags: number;
  internal_damage: number;
  internal_damage_keys: string[];
  mechflag_keys: string[];

  can_use_overclock: BooleanLike;
  overclock_safety_available: BooleanLike;
  overclock_safety: BooleanLike;
  overclock_mode: BooleanLike;
  overclock_temp_percentage: number;

  one_access: BooleanLike;
  regions: Region[];
  accesses: string[];

  servo_rating: number;
  scanmod_rating: number;
  capacitor_rating: number;

  cabin_pressure_warning_min: number;
  cabin_pressure_hazard_min: number;
  cabin_pressure_warning_max: number;
  cabin_pressure_hazard_max: number;
  cabin_temp_warning_min: number;
  cabin_temp_hazard_min: number;
  cabin_temp_warning_max: number;
  cabin_temp_hazard_max: number;

  one_atmosphere: number;
  cabin_pressure: number;
  cabin_temp: number;
  enclosed: BooleanLike;
  cabin_sealed: BooleanLike;
  dna_lock: string | null;
  weapons_safety: BooleanLike;
  mech_view: string;
  modules: MechModule[];
  selected_module_index: number;
  sheet_material_amount: number;
};

export type MechModule = {
  selected: BooleanLike;
  slot: string;
  icon: string;
  name: string;
  detachable: BooleanLike;
  can_be_toggled: BooleanLike;
  can_be_triggered: BooleanLike;
  active: BooleanLike;
  active_label: string;
  equip_cooldown: string;
  energy_per_use: number;
  snowflake: Snowflake;
  ref: string;
};

export type Snowflake = {
  snowflake_id: string;
  integrity: number;
};
