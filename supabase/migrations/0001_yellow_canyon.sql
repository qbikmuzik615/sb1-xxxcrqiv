/*
  # Create player data table

  1. New Tables
    - `player_data`
      - `id` (uuid, primary key)
      - `user_id` (text, unique)
      - `money` (integer)
      - `owned_houses` (text array)
      - `owned_vehicles` (text array)
      - `settings` (jsonb)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)
  2. Security
    - Enable RLS on `player_data` table
    - Add policy for authenticated users to read/write their own data
*/

CREATE TABLE IF NOT EXISTS player_data (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id text UNIQUE NOT NULL,
  money integer DEFAULT 1000,
  owned_houses text[] DEFAULT '{}',
  owned_vehicles text[] DEFAULT '{}',
  settings jsonb DEFAULT '{"walkSpeed": 16, "jumpPower": 50}'::jsonb,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE player_data ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own data"
  ON player_data
  FOR SELECT
  TO authenticated
  USING (auth.uid()::text = user_id);

CREATE POLICY "Users can insert own data"
  ON player_data
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can update own data"
  ON player_data
  FOR UPDATE
  TO authenticated
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);