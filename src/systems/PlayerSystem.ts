import { supabase } from '../lib/supabase';

export interface PlayerData {
  money: number;
  ownedHouses: string[];
  ownedVehicles: string[];
  settings: {
    walkSpeed: number;
    jumpPower: number;
  };
}

const DEFAULT_DATA: PlayerData = {
  money: 1000,
  ownedHouses: [],
  ownedVehicles: [],
  settings: {
    walkSpeed: 16,
    jumpPower: 50
  }
};

export class PlayerSystem {
  static async loadPlayerData(userId: string): Promise<PlayerData> {
    const { data, error } = await supabase
      .from('player_data')
      .select('*')
      .eq('user_id', userId)
      .single();
      
    if (error || !data) {
      return DEFAULT_DATA;
    }
    
    return data as PlayerData;
  }

  static async savePlayerData(userId: string, data: PlayerData) {
    const { error } = await supabase
      .from('player_data')
      .upsert({ 
        user_id: userId,
        ...data 
      });

    if (error) {
      console.error('Error saving player data:', error);
    }
  }
}