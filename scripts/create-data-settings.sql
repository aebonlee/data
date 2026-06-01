-- =============================================
-- data_settings 테이블 생성 (사이트 설정/키 저장 등)
-- Supabase SQL Editor에서 실행
-- 테이블명은 site.ts 의 dbPrefix('data_') + 'settings' 와 일치해야 함
-- =============================================

CREATE TABLE IF NOT EXISTS data_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS 활성화
ALTER TABLE data_settings ENABLE ROW LEVEL SECURITY;

-- 누구나 읽기 가능
CREATE POLICY "data_settings_public_select"
  ON data_settings FOR SELECT
  USING (true);

-- superadmin만 쓰기 가능 (user_profiles 는 사이트 공통 테이블 — 접두어 없음)
CREATE POLICY "data_settings_admin_insert"
  ON data_settings FOR INSERT
  WITH CHECK (
    EXISTS (SELECT 1 FROM user_profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

CREATE POLICY "data_settings_admin_update"
  ON data_settings FOR UPDATE
  USING (
    EXISTS (SELECT 1 FROM user_profiles WHERE id = auth.uid() AND role = 'superadmin')
  );

CREATE POLICY "data_settings_admin_delete"
  ON data_settings FOR DELETE
  USING (
    EXISTS (SELECT 1 FROM user_profiles WHERE id = auth.uid() AND role = 'superadmin')
  );
