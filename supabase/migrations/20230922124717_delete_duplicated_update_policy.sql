DROP POLICY "Users can update their own receipt." ON public.receipts;

CREATE POLICY "Users can update their own receipt" ON public.receipts AS permissive
    FOR UPDATE 
    TO authenticated
    USING (auth.uid() = author_id);