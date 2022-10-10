CREATE POLICY "Enable read access for all users" ON "public"."Maison"
AS PERMISSIVE FOR SELECT
TO public
USING (true)

CREATE POLICY "Enable insert for authenticated users only" ON "public"."Maison"
AS PERMISSIVE FOR INSERT
TO authenticated
WITH CHECK (true)

CREATE POLICY "Enable update for authenticated users only" ON "public"."Maison"
AS PERMISSIVE FOR UPDATE
TO authenticated
USING (true)
WITH CHECK (true)